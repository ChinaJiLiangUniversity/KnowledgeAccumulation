//
//  YFPageView.swift
//  YFPageViewDemo
//
//  Created by Allison on 2017/4/27.
//  Copyright © 2017年 Allison. All rights reserved.
//

import UIKit

class YFPageView: UIView {
    
    fileprivate var titlesArr : [String]
    fileprivate var childVcs :[UIViewController]
    fileprivate var parentVc :UIViewController
    fileprivate var style: YFPageStyle
    fileprivate var titleView : YFTitleView!

    // MARK: 构造函数
    init(frame : CGRect, titles : [String], childVcs : [UIViewController], parentVc : UIViewController,style:YFPageStyle) {
        
        self.titlesArr = titles
        self.childVcs = childVcs
        self.parentVc = parentVc
        self.style = style
        
        super.init(frame: frame)
        
         setupUI()
        
    }
    
    //只要有自定义构造函数,必须实现init方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
// MARK:- 设置UI界面内容
extension YFPageView {
    
    fileprivate func setupUI() {
        
        setupTitleView()
        setupContentView()
        
    }
    
    private func setupTitleView(){
        let titleFrame = CGRect(x: 0, y: 0, width: bounds.width, height: style.titleViewHeight)
        titleView = YFTitleView(frame: titleFrame, titles: titlesArr, style : style)
        addSubview(titleView)
        
    }
    
    private func setupContentView(){
        let contentFrame = CGRect(x: 0, y: style.titleViewHeight, width: bounds.width, height: bounds.height - style.titleViewHeight)
        let contentView = YFContentView(frame: contentFrame, childVcs: childVcs, parentVc: parentVc)
        addSubview(contentView)
        
        
        //让contentView成为titleView的代理
        titleView.delegate = contentView
        //让titleView成为contentView的代理
        contentView.delegate = titleView
    }
    
}









