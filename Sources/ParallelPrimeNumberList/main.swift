import Foundation
let start = Date()
func judgePrimeNumber(n: Int) -> Bool {
  for i in 2...Int(sqrt(Double(n))) {
    if n % i == 0 {
      return false
    }
  }
  return true
}
// let dispatchQueue = DispatchQueue(label: "primenumber", qos: .userInteractive, attributes: .concurrent)
let dispatchQueue = DispatchQueue(label: "primenumber", qos: .userInteractive)
let dispatchGroup = DispatchGroup()
for j in 5...1000000 {
  dispatchQueue.async(group: dispatchGroup) {
    dispatchGroup.enter()
    print("\(j): \(judgePrimeNumber(n: j))")
    dispatchGroup.leave()
  }
}
dispatchGroup.notify(queue: .main) {
  let elapsed = Date().timeIntervalSince(start)
  print(elapsed)
  print("Done")
}
RunLoop.current.run()
