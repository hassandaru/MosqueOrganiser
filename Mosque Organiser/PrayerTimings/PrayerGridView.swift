//
//  PrayerGridView.swift
//  Mosque Organiser
//
//  Created by Hassan Sohail Dar on 5/1/22.
//

import SwiftUI

struct PrayerGridView: View {
    //to control if it is dark mode or not
    @State private var isNight = false
    @State var titleset = "Prayer Timings"
    @State var sPrayer = MockData.samplePrayer
    var body: some View {
        
        //so we need a zstack with gradient CHECK
        //then we need the heading with spacer CHECK
        //then the array of prayers from mock data to be filled. CHECK
        //then show the navigation controller... this is where it gets challenging but we will get there :)
        
        ZStack {
            BackgroundView(isNight: $isNight)
            TabView {
                VStack {
                    TitleView(title: $titleset)
                    Spacer()
                    
                    ForEach(MockData.prayers,  id: \.id) { prayer in
                        PrayerTitleView(prayer: prayer)

                    }
                    Spacer()
                    
                    }
                .tabItem {
                    Image(systemName: "timer")
                    Text("Prayer")
                        .foregroundColor(.white)
                    }
                Text("Events")
                    .tabItem {
                        Image(systemName: "newspaper.fill")
                        Text("Events")
                    }
                Text("Address")
                    .tabItem {
                        Image(systemName: "map.fill")
                        Text("Location")
                    }
                Text("Profile")
                    .tabItem {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Profile")
                    }
            }
            .font(.headline)
            // binding basically enforces that the value for the object stays the same
            
            
        }
//            .navigationTitle("Prayer Timings")
            
            //setup binding so it changes as required.
            //            TitleView(title: $titleset)
        }
        
        
}



struct PrayerGridView_Previews: PreviewProvider {
    static var previews: some View {
        PrayerGridView()
            .preferredColorScheme(.light)
    }
}

struct BackgroundView: View {
    //binding forces the state to stay the same
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct TitleView: View {
    @Binding var title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 32, weight: .medium, design: .default))
            .underline()
            .foregroundColor(.white)
            .padding()
    }
}

struct PrayerTitleView: View {
    //selected prayer to print
    var prayer: Prayer
    
    var body: some View {
        HStack {
            Text(prayer.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(1)
                .padding()
            Text(prayer.time)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(1)
                .padding()
            
        }
        .padding()
    }
}
