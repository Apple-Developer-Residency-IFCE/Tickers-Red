//
//  SounScreenService.swift
//  Tickers
//
//  Created by Julia Morales on 06/07/23.
//
import Foundation

class APICaller{
    static let shared = APICaller()
    
    func fetchSong() async throws -> SoundStructModel? {
        
        //create the new url
        guard let url = URL(string: "https://freesound.org/apiv2/sounds/572947/?token=Tc58tO9LOslcd4j2Et5EhWnSrgFr6Z4KobSlO6gR%22") else {
            return nil  }
        
        //create a new urlRequest passing the url
        let request = URLRequest(url: url)
        
        //run the request and retrieve both the data and the response of the call
        let (data, _) = try await URLSession.shared.data(for: request)
        
        //checks if there are errors regarding the HTTP status code and decodes using the passed struct
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let fetchedData = try decoder.decode(SoundStructModel.self, from: data)
        
        print(fetchedData)
        
        return fetchedData
        
    }
    
}
