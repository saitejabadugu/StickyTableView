//
//  ViewController.swift
//  StickyTableView
//
//  Created by Keerthi Devipriya(kdp) on 14/09/23.
//

import UIKit

class ViewController: UIViewController {
    lazy var header: UIView = {
        let hader = UIView()
        hader.translatesAutoresizingMaskIntoConstraints = false
        return hader
    }()
    lazy var myTv: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(header)
        setTableView()
        setUI()
    }
    
    func setTableView() {
        myTv.delegate = self
        myTv.dataSource = self
        myTv.bounces = true
    }
    
    func setUI() {
        self.view.addSubview(header)
        self.view.addSubview(myTv)
        //header.layer.zPosition = 5
        header.backgroundColor = .blue

        
        NSLayoutConstraint.activate([
            header.heightAnchor.constraint(equalToConstant: 250),
            header.topAnchor.constraint(equalTo: self.view.topAnchor),
            header.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            header.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            myTv.topAnchor.constraint(equalTo: self.header.bottomAnchor),
            myTv.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            myTv.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            myTv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section != 0 {
            let cell = UITableViewCell()
            cell.backgroundColor = .red
            return cell

        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 70))
            let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50))
            lbl.text = "Section \(section)"
            view.addSubview(lbl)
            return view
          
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 100 : 0
    }
}

