/*
 Patrick Mims
 October 28, 2002
 ISYS556
 Midterm
 */
import SwiftUI

struct ContentView: View {
    @State private var imgName = "Hamburger"
    @State private var priceLabel = "12.99"
    @State private var unitStr = "1"
    @State private var totalAmt = 0.0
    
    var body: some View {
        Text("How May I Take Your Order?")
            .padding()
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack {
                Image(imgName)
                    .resizable()
                    .frame(width: 300, height: 200, alignment: .center)
                    .scaledToFill()
                    .padding(20)
                Text(priceLabel)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                HStack {
                    Text("Quantity: ")
                        .padding(.leading, 50.0)
                    TextField("1", text: $unitStr)
                        .border(Color(UIColor.separator))
                        .padding(.all)
                }
                
                Button("Show Next Dish") {
                    if imgName == "Hamburger" {
                        imgName = "Pizza"
                        priceLabel = "Pizza: 13.99"
                        unitStr = "1"
                        totalAmt = 0.0
                    } else if imgName == "Pizza" {
                        imgName = "Sushi"
                        priceLabel = "Sushi: 14.99"
                        unitStr = "1"
                        totalAmt = 0.0
                    } else if imgName == "Sushi" {
                        imgName = "Crepes"
                        priceLabel = "Crepes: 15.99"
                        unitStr = "1"
                        totalAmt = 0.0
                    } else if imgName == "Crepes" {
                        imgName = "Fries"
                        priceLabel = "Fries: 15.99"
                        unitStr = "1"
                        totalAmt = 0.0
                    } else {
                        imgName = ""
                        priceLabel = "Try A Different Restraurant"
                        unitStr = "1"
                        totalAmt = 0.0
                    }
                }
                .font(.caption)
                .buttonStyle(.borderedProminent)
                .padding()
                Button("Order This Dish") {
                    let unit = Double(unitStr)
                    
                    if imgName == "Hamburger" {
                        totalAmt =  unit! * 12.99
                    }
                    else if imgName == "Pizza" {
                        totalAmt = unit! * 13.99
                    }
                    else if imgName == "Sushi" {
                        totalAmt = unit! * 14.99
                    }
                    else if imgName == "Crepes" {
                        totalAmt = unit! * 15.99
                    }
                    else if imgName == "Fries" {
                        totalAmt = unit! * 16.99
                    }
                    else {
                        totalAmt = 0.0
                    }
                }
                .font(.caption)
                .buttonStyle(.borderedProminent)
                .padding()
                
                Text("Total Payment: $\(totalAmt, specifier: "%.2f")")
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
