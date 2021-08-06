//
//  NetworkManager.swift
//  ExamProject
//
//  Created by Veronika Shadlovskaya on 05.08.2021.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<API> { get }
    
    func fetchPlacesNearby(latitude: Double, longitude: Double, completion: @escaping (Result<MetaAndMapObjectResponse, Error>) -> ())
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])

    func fetchPlacesNearby(latitude: Double, longitude: Double, completion: @escaping (Result<MetaAndMapObjectResponse, Error>) -> ()) {
            request(target: .explore(latitude,longitude), completion: completion)
        }
    func fetchVenueDetails(id: String,completion: @escaping (Result<MetaAndVenueDetailsResponse, Error>) -> ()) {
        request(target: .venues(id), completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping(Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do{
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
