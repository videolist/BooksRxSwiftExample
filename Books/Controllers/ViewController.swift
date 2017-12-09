//
//  ViewController.swift
//  Books
//
//  Created by Vadim on 12/8/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    let viewModel = BooksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UINib.init(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookTableViewCell")

        viewModel.books
            .drive(tableView.rx.items(cellIdentifier: "BookTableViewCell")) {
                (index, model, cell: BookTableViewCell) in
                cell.configure(for: model)
            }
            .disposed(by:self.rx.disposeBag)

        
        textField.rx.controlEvent(.editingDidEndOnExit).asObservable()
            .map { self.textField.text ?? "" }
            .filter { $0.count > 0 }
            .bind(to: viewModel.searchTerm)
            .disposed(by: self.rx.disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

