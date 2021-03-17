//
//  ViewController.swift
//  PhotosExample_Review
//
//  Created by 하동훈 on 2021/03/17.
//

import UIKit
import Photos

class ViewController: UIViewController {

    // MARK: - Properties
    let cellIdentifier: String = "cell"
    
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager = PHCachingImageManager()
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Methods
    func requestCollection() {
        let cameraRoll: PHFetchResult<PHAssetCollection> =
            PHAssetCollection.fetchAssetCollections(with: .smartAlbum,
                                                    subtype: .smartAlbumUserLibrary,
                                                    options: nil)
        
        guard let cameraRollCollection = cameraRoll.firstObject else {
            return
        }
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
    }
    
    func checkPhotoAuthorization() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAuthorizationStatus {
        case .authorized:
            print("접근 허가됨")
            self.requestCollection()
            self.tableView.reloadData()
        case .denied:
            print("접근 불허")
        case .notDetermined:
            print("아직 응답하지 않음")
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    print("사용사가 허용함")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                    }
                case .denied:
                    print("사용자가 불허함")
                default: break
                }
            }
        case .restricted:
            print("접근 제한")
        case .limited:
            print("부분 허용")
        @unknown default:
            print("")
        }
        PHPhotoLibrary.shared().register(self)
    }
    
    // MARK: - IBActions
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        self.tableView.reloadData()
    }
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        checkPhotoAuthorization()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? ImageZoomViewController else { return}
        guard let cell = sender as? UITableViewCell else { return }
        guard let index = self.tableView.indexPath(for: cell) else { return }
        
        nextVC.asset = self.fetchResult[index.row]
    }
}

// MARK: - UITableViewDataSource, Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let asset = fetchResult.object(at: indexPath.row)
        let options = PHImageRequestOptions()
        options.resizeMode = .exact
        
        imageManager.requestImage(for: asset,
                                  targetSize: CGSize(width: 30, height: 30),
                                  contentMode: .aspectFill,
                                  options: options,
                                  resultHandler: { (image, _) in
                                    cell.imageView?.image = image
                                  })
        
        return  cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let asset: PHAsset = self.fetchResult[indexPath.row]
            
            PHPhotoLibrary.shared().performChanges ({
                PHAssetChangeRequest.deleteAssets([asset] as NSArray)
            }, completionHandler: nil)
        }
    }
}

// MARK: - PHPhotoLibararyChangeObserver
extension ViewController: PHPhotoLibraryChangeObserver {

    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: fetchResult) else { return }
        
        fetchResult = changes.fetchResultAfterChanges
        
        OperationQueue.main.addOperation {
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
}
