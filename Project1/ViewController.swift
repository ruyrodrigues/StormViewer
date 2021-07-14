import UIKit

class ViewController: UITableViewController {

    @IBOutlet var labelTotalImages: UILabel!
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                //This is a picture!
                pictures.append(item)
            }
        }
        pictures.sort()
        labelTotalImages.text = "Total of images: \(pictures.count)"
        labelTotalImages.font = labelTotalImages.font.withSize(20)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        let selectedImageNumber = indexPath.row + 1
        cell.textLabel?.text = "\(selectedImageNumber) - \(pictures[indexPath.row])"
        cell.textLabel?.font = cell.textLabel?.font.withSize(25)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

