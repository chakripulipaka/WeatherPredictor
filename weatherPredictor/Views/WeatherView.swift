//
//  WeatherView.swift
//  weatherPredictor
//
//  Created by Chakri Pulipaka on 2/1/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing:20){
                            Image(systemName: "sun.max").font(.system(size:40))
                            Text(weather.weather[0].main)
                        }
                        
                        .frame(width: 150, alignment: .leading)
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°").font(.system(size:100)).fontWeight(.bold).padding()
                    }
                    
                    Spacer().frame(height:80)
                    
                    AsyncImage(url: URL(string:"https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8b706595-f0cd-42f2-9778-da1b590a294b/dev22ap-65e7ccbb-7f95-4e10-b3db-d5cee4e392fb.png/v1/fill/w_1000,h_707,q_80,strp/cartoon_city_background___1_by_animaltoonstudios20_dev22ap-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzA3IiwicGF0aCI6IlwvZlwvOGI3MDY1OTUtZjBjZC00MmYyLTk3NzgtZGExYjU5MGEyOTRiXC9kZXYyMmFwLTY1ZTdjY2JiLTdmOTUtNGUxMC1iM2RiLWQ1Y2VlNGUzOTJmYi5wbmciLCJ3aWR0aCI6Ijw9MTAwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.mxWiJqXeAaAS92jkSlInCe2RgLT85CRMchiMUWc3b5I")){
                        image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:350)
                    } placeholder:{
                        ProgressView()
                    }
                    
                    Spacer()
                    
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing:20){
                    Text("Weather Now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer.low", name: "Min temp", value:(weather.main.tempMin.roundDouble() + "°"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer.high", name: "Max temp", value:(weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind speed", value:(weather.wind.speed.roundDouble() + " m/s"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer.variable.and.figure", name: "Feels like ", value:(weather.main.feels_like.roundDouble() + "°"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation:0.787, brightness:0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation:0.787, brightness:0.354))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
