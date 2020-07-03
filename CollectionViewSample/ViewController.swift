//
//  ViewController.swift
//  CollectionViewSample
//
//  Created by SRA01 on 2020/07/02.
//  Copyright © 2020 SRA01. All rights reserved.
//

import UIKit

class CellData {
    var label: String
    
    init(label: String) {
        self.label = label
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var dataCollectionView: UICollectionView!
    
    var data: [CellData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1..<100 {
            self.data.append(CellData(label: i.description))
        }
        self.dataCollectionView.allowsMultipleSelection = true
        // 画面サイズ
        print(UIScreen.main.bounds.size)
    }

    @IBAction func onTapSelectAllBtn(_ sender: UIBarButtonItem) {
        print("onTapSelectAllBtn")
        (0..<dataCollectionView.numberOfItems(inSection: 0))
        .map{IndexPath(item: $0, section: 0)}
            .forEach{
                dataCollectionView.selectItem(at: $0, animated: false, scrollPosition: [])
        }
    }
    @IBAction func onTapDeselectAllBtn(_ sender: UIBarButtonItem) {
        print("onTapDeselectAllBtn")
        (0..<dataCollectionView.numberOfItems(inSection: 0))
        .map{IndexPath(item: $0, section: 0)}
            .forEach{
                dataCollectionView.deselectItem(at: $0, animated: false)
        }
    }
}

extension ViewController: UICollectionViewDelegate {
}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let selectedBGView = UIView(frame: cell.frame)
        selectedBGView.backgroundColor = .red
        cell.selectedBackgroundView = selectedBGView
        
        let label = cell.contentView.viewWithTag(1) as! UILabel
        label.text = self.data[indexPath.row].label
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = self.view.bounds.width / 4 - 20
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
