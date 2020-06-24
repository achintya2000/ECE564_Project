//
//  AnalyticDiffEq.swift
//  ECE564_Project
//
//  Created by Achintya Kumar on 6/21/20.
//  Copyright © 2020 Achintya Kumar. All rights reserved.
//

import SwiftUI
import URLImage

// Solves ODEs using the Wolfram API and REST API
struct AnalyticDiffEq: View {
    @State var equation = ""
    @State var getURL = "http://api.wolframalpha.com/v1/simple?appid=XG7L3G-WJ66P2PLJP&i="
    @State var toggleImage = false
    
    @State var display = UIImage(systemName: "circle")!
    
    var body: some View {
        Form {
            TextField("Diff Eq", text: $equation)
            
            Button(action: {
                self.equation = self.equation.replacingOccurrences(of: "+", with: "%2b")
                self.getURL = self.getURL + self.equation
                //print(self.getURL)

                self.toggleImage.toggle()
                
                var result = self.getURL.filter { !$0.isWhitespace }
                result = result.replacingOccurrences(of: "’", with: "'")
                //print(result)
                self.dowork(url: result)
            }) {
                Text("Submit")
                
            }.sheet(isPresented: $toggleImage) {
                Image(uiImage: self.display)
                    .resizable()
                    .frame(width: UIScreen.screenWidth*0.9, height: UIScreen.screenHeight*0.8)
                //URLImage(URLRequest(url: URL(string: "http://api.wolframalpha.com/v1/simple?appid=XG7L3G-WJ66P2PLJP&i=y''%2by'=0")!))
            }
        }
    }
    
    func dowork(url: String) -> Void {
        let catPictureURL = URL(string: url)
        
        let session = URLSession(configuration: .default)

        let downloadPicTask = session.dataTask(with: catPictureURL!) { (data, response, error) in
            
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        let image = UIImage(data: imageData)
                        // Do something with your image.
                        self.display = image!
                        
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }

        downloadPicTask.resume()
    }
}

struct AnalyticDiffEq_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticDiffEq()
    }
}
