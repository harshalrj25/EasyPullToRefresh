# EasyPullToRefresh  :loudspeaker:

[![CI Status](https://img.shields.io/travis/harshalrj25/EasyPullToRefresh.svg?style=flat)](https://travis-ci.org/harshalrj25/EasyPullToRefresh)
[![Version](https://img.shields.io/cocoapods/v/EasyPullToRefresh.svg?style=flat)](https://cocoapods.org/pods/EasyPullToRefresh)
[![License](https://img.shields.io/cocoapods/l/EasyPullToRefresh.svg?style=flat)](https://cocoapods.org/pods/EasyPullToRefresh)
[![Platform](https://img.shields.io/cocoapods/p/EasyPullToRefresh.svg?style=flat)](https://cocoapods.org/pods/EasyPullToRefresh)

Easily integrate pull to refresh without any hassle. Handle empty tableview with a single line. No need to add anything to storyboard or xib or code.

## Example :books:

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation :hourglass_flowing_sand:

EasyPullToRefresh is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EasyPullToRefresh'
```
![alt text](https://github.com/harshalrj25/MasterAssetsRepo/blob/master/EasyPullToRefresh.gif "TableView")

## Usage :bulb:

After installation the pull to refresh will be available for every tableview inside your project.
Use below call back to handle the refresh event.

        self.tableView.customRefresh {
            // You can do your API call here
        }
        
Similarly if the tableview is empty, a message will be shown along with a reload button.
Use below call back to handle reload event.

        self.tableView.customReload {
            // You can do your API call here
        }

If you dont like the colors and theme, override all the controls according to your needs.
You can override default colors and appearance for the UIRefreshControl, ReloadButton and DataEmptyLabel.
Use Below variable names to access the controls
          
        // 1: Disable pull to refresh using the flag
        self.tableView.showPullToRefresh = false
        
        // 2: Disable empty tableview message and reload button
        self.tableView.showReloadOnEmpty = false
        
        // 3: Customize the UiRefreshControl
        self.tableView.customRefreshControl.backgroundColor = UIColor.green
        self.tableView.customRefreshControl.tintColor = UIColor.green
        
        // 4: Override custom message for empty tableview using below label
        self.tableView.customEmptyMessageLabel.text = "YOUR CUSTOM TEXT FOR EMPTY LIST"
        
        // 5: Customize the Reload button for empty tableview
        self.tableView.customReloadButton.backgroundColor = UIColor.green
        self.tableView.customReloadButton.layer.borderColor = UIColor.red.cgColor


## Author :innocent:

My email id, harshalrj25@gmail.com

<table style="background-color:#F5F5DC">
<tr>
<td>
<img src="https://github.com/harshalrj25/MasterAssetsRepo/blob/master/myAvatar.jpg" width="180"/>

Harshal Jadhav

<p align="center">
<a href = "https://github.com/harshalrj25"><img src = "https://github.com/harshalrj25/MasterAssetsRepo/blob/master/gitHubLogo.png" width="32" height = "33"/></a>
<a href = "https://stackoverflow.com/users/7882093/harshal-jadhav?tab=profile"><img src = "https://github.com/harshalrj25/MasterAssetsRepo/blob/master/stackoverflow svg icon.svg" width="36" height="36"/></a>
<a href = "https://www.linkedin.com/in/harshal-jadhav-298ba416a/"><img src = "https://github.com/harshalrj25/MasterAssetsRepo/blob/master/linkedInLogo.svg" width="36" height="36"/></a>
</p>
</td>
</tr> 
</table>

## License


It's all your's :gift: 
