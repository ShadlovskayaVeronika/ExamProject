//
//  CardViewController.swift
//  ExamProject
//
//  Created by Veronika Shadlovskaya on 05.08.2021.
//

import UIKit
import Moya

class CardViewController: UIViewController {
    let cardView = CardView()
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = cardView
        fetchDetails()
    }
    
    func fetchDetails() {
        let networkManager = NetworkManager()
        networkManager.fetchVenueDetails(id: id){ [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let venueDetails):
                print(venueDetails.response)
                strongSelf.setView(with: venueDetails.response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setView(with data: VenueDetailsResponse?) {
        cardView.phone.text = "Phone: \(data?.venue?.contact?.formattedPhone ?? "")"
        cardView.facebookButton.setTitle(data?.venue?.contact?.facebookName ?? "facebook", for: .normal)
        cardView.twitterButton.setTitle(data?.venue?.contact?.twitter ?? "twitter", for: .normal)
        cardView.instagramButton.setTitle(data?.venue?.contact?.instagram ?? "instagram", for: .normal)
    }
       
}



