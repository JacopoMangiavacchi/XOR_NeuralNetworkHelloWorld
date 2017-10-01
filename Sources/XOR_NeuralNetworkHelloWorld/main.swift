import Foundation
import SwiftNeuralNetwork


// Input matrix for all 4 XOR Cases
var input = [[0.0, 0.0],
             [1.0, 0.0],
             [0.0, 1.0],
             [1.0, 1.0]]

// Corresponding output - XOR is TRUE if both are different
var ideal = [[0.0],
             [1.0],
             [1.0],
             [0.0]]

print("Train:")


var neuralNetwork = Network(inputCount: 2, hiddenCount: 4, outputCount: 1, learnRate: 1.0, momentum: 0.9)  // or hiddenCount: 5


for i in 0..<5000 {
	for j in 0..<input.count {
        neuralNetwork.train(input: input[j], ideal: ideal[j])
	}

	print("Epoch # \(i) - Error: \(neuralNetwork.getError(len: input.count))")
}

print("\nTest Accuracy:")

for i in 0..<input.count {
	var s = "\(i) = [ "
	for j in 0..<input[0].count {
		s += "\(input[i][j]), "
	}
	s += "]"

    let output = neuralNetwork.predict(input: input[i])

	s += " => [ "
	for p in 0..<output.count {
		s += "\(String(format:"%.2f", output[p])), "
	}
	s += "]"

    print(s)
}



