//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Timothy Ng on 11/24/17.
//  Copyright © 2017 Timothy Ng. All rights reserved.
//

import Foundation
import UIKit

class SentMemesCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var memes = [Meme]()
    
    @IBOutlet weak var memesCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        NotificationCenter.default.addObserver(self, selector: #selector(reloadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        print("viewWillAppear CollectView called")
        memesCollection.reloadData()
    }
    

    
//    @objc func reloadList() {
//        memesCollection.reloadData()
//    }
    
    @IBAction func addMeme(_ sender: Any) {
        let memeEditorVC = self.storyboard?.instantiateViewController(withIdentifier: "MemeEditorVC") as! MemeEditorVC
        self.navigationController?.present(memeEditorVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        memes = appDelegate.memes
        return memes.count
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         print("viewWillDisappear CollectionView called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear CollectionView called")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let meme = memes[(indexPath as NSIndexPath).row]
        
        cell.cellImageView?.image = meme.memedImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailViewController.meme = memes[(indexPath as NSIndexPath).row]
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
    
    
    
}
