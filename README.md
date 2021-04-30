# MVC

Implementing elementary architecture MVC (Model-View-Controller).

# Network Service

Function for parsing data into an application

class NetworkService{
    
    private init(){}
    static let shared = NetworkService()
    
    public func getData(url: URL, completion: @escaping (Any) -> ()){
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async(execute: {
                    completion(json)
                })
            }catch{
                print(error)
            }
        }.resume()
    }
    
}
