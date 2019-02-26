//
//  EasyPullToRefresh.swift
//  EasyPullToRefresh
//
//  Created by harshalrj25 on 02/26/2019.
//  Copyright (c) 2019 harshalrj25. All rights reserved.
//

import UIKit
import Foundation

extension UITableView {
    struct Holder {
        static var _showPullToRefresh:Bool = true
        static var _showReloadOnEmpty:Bool = true
        static var _customEmptyView:UIView = {
            let view = UIView(frame: CGRect(x: 0, y: 0, width:200, height: 200))
            view.sizeToFit()
            return view
        }()
        static var _customEmptyMessageLabel:UILabel = {
            let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width:200, height: 90))
            messageLabel.text = "The list is empty 😕"
            messageLabel.textColor = .lightGray
            messageLabel.numberOfLines = 0
            messageLabel.adjustsFontSizeToFitWidth = true
            messageLabel.minimumScaleFactor = 0.5
            messageLabel.textAlignment = .center
            messageLabel.font = UIFont(name: "TrebuchetMS", size: 18)
            messageLabel.sizeToFit()
            return messageLabel
        }()
        static var _customReloadButton:UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("RELOAD", for: .normal)
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.addTarget(self, action: #selector(handleReload(_:)), for: .touchUpInside)
            return button
        }()
        static var _customRefreshControl: UIRefreshControl = {
            let control = UIRefreshControl()
            control.addTarget(self, action:
                #selector(handleRefresh(_:)),
                              for: UIControl.Event.valueChanged)
            return control
        }()
    }
    public var customEmptyView:UIView {
        get {
            return Holder._customEmptyView
        }
        set(newValue) {
            Holder._customEmptyView = newValue
        }
    }
    public var customEmptyMessageLabel:UILabel {
        get {
            return Holder._customEmptyMessageLabel
        }
        set(newValue) {
            Holder._customEmptyMessageLabel = newValue
        }
    }
    public var customReloadButton:UIButton {
        get {
            return Holder._customReloadButton
        }
        set(newValue) {
            Holder._customReloadButton = newValue
        }
    }
    public var customRefreshControl:UIRefreshControl {
        get {
            return Holder._customRefreshControl
        }
        set(newValue) {
            Holder._customRefreshControl = newValue
        }
    }
    public var showPullToRefresh:Bool {
        get {
            return Holder._showPullToRefresh
        }
        set(newValue) {
            Holder._showPullToRefresh = newValue
        }
    }
    public var showReloadOnEmpty:Bool {
        get {
            return Holder._showReloadOnEmpty
        }
        set(newValue) {
            Holder._showReloadOnEmpty = newValue
        }
    }
    
    @available(iOS 9.0, *)
    private func setupUiForReloadButton() {
        if showReloadOnEmpty{
            customEmptyView.addSubview(customEmptyMessageLabel)
            customEmptyView.addSubview(customReloadButton)
            customReloadButton.translatesAutoresizingMaskIntoConstraints = false
            customReloadButton.centerXAnchor.constraint(equalTo: customEmptyView.centerXAnchor, constant:0).isActive = true
            customReloadButton.centerYAnchor.constraint(equalTo: customEmptyView.centerYAnchor, constant:0).isActive = true
            customReloadButton.widthAnchor.constraint(equalToConstant: 140.0).isActive = true
            customReloadButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
            
            customEmptyMessageLabel.translatesAutoresizingMaskIntoConstraints = false
            customEmptyMessageLabel.centerXAnchor.constraint(equalTo: customEmptyView.centerXAnchor, constant:0).isActive = true
            customEmptyMessageLabel.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
            customEmptyMessageLabel.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
            customEmptyMessageLabel.bottomAnchor.constraint(equalTo: customReloadButton.bottomAnchor, constant:-50).isActive = true
            self.backgroundView = customEmptyView
        }
    }
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        if showPullToRefresh{
            self.addSubview(customRefreshControl)
        }
        if #available(iOS 9.0, *) {
            setupUiForReloadButton()
        } else {
            // Fallback on earlier versions
        }
        checkIfReloadControlShouldHide()
    }
    // This method is called everytime tableview reloads
    open override func setNeedsLayout() {
        super.setNeedsLayout()
        checkIfReloadControlShouldHide()
    }
    private func checkIfReloadControlShouldHide() {
        if showReloadOnEmpty{
            if self.numberOfRows(inSection: 0) == 0{
                self.separatorStyle = .none
                self.showReloadButton(flag: true)
            }else{
                self.showReloadButton(flag: false)
            }
        }
    }
    @objc private func handleRefresh(_ refreshControl: UIRefreshControl) {
        if let action = self.refreshActionVar {
            refreshControl.endRefreshing()
            action?()
        } else {
            print("no action")
        }
    }
    // this method is publically called callback for pull to refresh
    public func customRefresh(action: (() -> Void)?){
        self.refreshActionVar = action
    }
    private struct AssociatedObjectKeys {
        static var refreshRecognizer = "RefreshTableViewUIRefreshControl"
    }
    private typealias Action = (() -> Void)?
    private var refreshActionVar: Action? {
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedObjectKeys.refreshRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let refreshRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.refreshRecognizer) as? Action
            return refreshRecognizerActionInstance
        }
    }
    
    @objc private func handleReload(_ reloadControl: UIButton) {
        if let action = self.reloadActionVar {
            checkIfReloadControlShouldHide()
            action?()
        } else {
            print("no action")
        }
    }
    // this method is publically called callback for reload
    public func customReload(action: (() -> Void)?){
        self.reloadActionVar = action
    }
    private struct AssociatedObjectKeysReload {
        static var reloadRecognizer = "ReloadTableViewUIReloadControl"
    }
    private typealias ActionForReload = (() -> Void)?
    private var reloadActionVar: ActionForReload? {
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedObjectKeysReload.reloadRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let refreshRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeysReload.reloadRecognizer) as? ActionForReload
            return refreshRecognizerActionInstance
        }
    }
    private func showReloadButton(flag:Bool){
        DispatchQueue.main.async {
            self.customReloadButton.isHidden = !flag
        }
    }
    
    func scrollToFirstRow() {
        let indexPath = IndexPath(row: 0, section: 0)
        self.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}


