/*
  RecBinarySearch.swift
  
  By Zefeng Wang
  Created on January 24, 2022
  
  This program reads the input.txt file and uses a recursive function to calculate and output 
  the list of steps needed to move all of the disks in the from peg 1 to peg 3 in the Tower of Hanoi puzzle
*/

// import Foundation module
import Foundation

// Outputs the steps required to move num disks from the start ped to the end peg
func hanoi(num: Int, start: Int, end: Int) {
	if num == 1 {
		print("Move disk from peg \(start) to peg \(end)")
	} else {
		hanoi(num: num - 1, start: start, end: 6 - (start + end))
      		print("Move disk from peg \(start) to peg \(end)")
		hanoi(num: num - 1, start: 6 - (start + end), end: end)
	}
}

// Reads each line from input.txt
let contents = try String(contentsOfFile: "input.txt")
let dataArr = contents.components(separatedBy: "\n").filter { $0 != "" }

// Outputs the all of steps needed to beat the Tower of Hanoi and outputs error messages
var line = 1
if dataArr.count != 0 {
	for index in 0..<dataArr.count {
		print("Output for line \(line):")
		if let num = Int(dataArr[index]), num >= 0 {
			hanoi(num: num, start: 1, end: 3)
		} else {
			print("Please enter a positive integer")
		}
		line += 1
	}
} else {
	print("Please enter at least one number")
}
