//
//  ViewController.swift
//  Random Photo Gen
//
//  Created by Dawson Miskin on 2/2/23.
//

import UIKit

class ViewController: UIViewController {
     
    //Set up got the image view and scale
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    //Set up for the button that generates photo
    //title is what will be on the button
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Generate Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    //The list of colors to go though when the Generate Photo
    // button is taped
    let colors: [UIColor] = [
        .systemOrange,
        .systemRed,
        .systemGray,
        .systemMint,
        .systemBrown,
        .systemYellow]
    
    //set up for the layout of the photo as well as the button
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    //this is putting the photo into the frame that was made and putting
    // it in the place on the screen it is desired
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55
        )
    }
    
    //Tap button funcion toat calls the photo to get another pic
    //and changes the background color
    @objc func didTapButton(){
            getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
        }
        
    
    //This function is taking the url and creating a sting into the url to get the image from then it is passed with data 
    func getRandomPhoto() {
        let urlString =
            "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url)
        else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}

