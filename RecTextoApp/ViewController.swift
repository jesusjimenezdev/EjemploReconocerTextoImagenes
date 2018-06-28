import UIKit
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var texto: UITextView!
    var imagen = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func camara(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func leer(_ sender: UIButton) {
        let tesseract:G8Tesseract = G8Tesseract(language: "eng+spa")
        tesseract.delegate = self
        //tesseract.charBlacklist = "123"
        tesseract.image = imagen
        tesseract.recognize()
        print(tesseract.recognizedText!)
        texto.text = tesseract.recognizedText!
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imagenTomada = info[UIImagePickerControllerEditedImage] as? UIImage
        imagen = imagenTomada!
        imageView.image = imagenTomada
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    

}

