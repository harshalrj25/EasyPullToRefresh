# EasyPullToRefresh  :loudspeaker:

[![CI Status](https://img.shields.io/travis/harshalrj25/EasyPullToRefresh.svg?style=flat)](https://travis-ci.org/harshalrj25/EasyPullToRefresh)
[![Version](https://img.shields.io/cocoapods/v/EasyPullToRefresh.svg?style=flat)](https://cocoapods.org/pods/EasyPullToRefresh)
[![License](https://img.shields.io/cocoapods/l/EasyPullToRefresh.svg?style=flat)](https://cocoapods.org/pods/EasyPullToRefresh)
[![Platform](https://img.shields.io/cocoapods/p/EasyPullToRefresh.svg?style=flat)](https://cocoapods.org/pods/EasyPullToRefresh)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

EasyPullToRefresh is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EasyPullToRefresh'
```
![alt text](https://github.com/harshalrj25/MasterAssetsRepo/blob/master/EasyPullToRefresh.gif "TableView")

## Usage

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
