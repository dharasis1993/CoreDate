//
//  ImagePicker.swift
//  Bank
//
//  Created by dharasis behera on 07/02/21.
//

import UIKit

protocol ImagePickerDelegate: class {
    func didSelectphoto(image: UIImage?)
}
    
class ImagePicker: NSObject{

    private let pickerController: UIImagePickerController
    private weak var presentingViewController: UIViewController?
    private weak var delegate: ImagePickerDelegate?
    
    public init(presentingViewController: UIViewController, delegate: ImagePickerDelegate) {
        self.pickerController = UIImagePickerController()
        self.presentingViewController = presentingViewController
        self.delegate = delegate
        
        super.init()

        self.pickerController.delegate = self
        self.pickerController.mediaTypes = ["public.image"]
        self.pickerController.sourceType = .photoLibrary

    }
    
    func presentImagePicker(){
        self.presentingViewController?.present(self.pickerController, animated: true)
    }
    
    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
           controller.dismiss(animated: true, completion: nil)
           self.delegate?.didSelectphoto(image: image)
       }
}

extension ImagePicker: UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            return pickerController(picker, didSelect: nil)
        }
        return pickerController(picker, didSelect: image)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        return pickerController(picker, didSelect: nil)
    }
}

extension ImagePicker: UINavigationControllerDelegate{}
