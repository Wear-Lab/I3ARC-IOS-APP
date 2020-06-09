//
//  ItemSortingFunctions.swift
//  Shopping List
//
//  Created by Jacob O'Quinn on 5/11/20.
//  Copyright © 2020 Jacob Oquinn. All rights reserved.
//
// This Item Helper class contains functions helpful for sorting the items list
//


//  THIS FILE CURRENTLY IS NOT IN USE


/*
import Foundation

class ItemHelper{

    // This function will sort the customer item list
    // Place unpurchased items at the top
    // Using bubble sort O(n^2) but n is usually small
    // example call: sortItems(in: items)
    static func sortItems(in itemsArr: inout [Item]){
       
       // This function could be made faster by splitting up the items initially purchased and not purchased items
       // Let numPurchased = numItemsPurchased(in: itemsArr)
       
       // Sort the items using bubble sort
       let s1 = 0...(itemsArr.count - 2)
       for e in s1{
           let s2 = 0...(itemsArr.count - 1 - e - 1)
           for i in s2{
               // If they are the same comparre the letters
               if(itemsArr[i].purchased == itemsArr[i + 1].purchased){
                    if(strcmp(itemsArr[i].name, itemsArr[i + 1].name) > 0){
                        swapItems(in: &itemsArr, atPos: i)
                    }
               }
               // else if pos i is purchased, items should be swapped
               else if(itemsArr[i].purchased){
                   swapItems(in: &itemsArr, atPos: i)
               }
           }
       }
    }
    // Takes in an array of items and swaps pos i and i + 1
    static func swapItems(in itemsArr: inout [Item], atPos i: Int){
       var temp: Item
       temp            = itemsArr[i]
       itemsArr[i]     = itemsArr[i + 1]
       itemsArr[i + 1] = temp
    }

    /*
    // Returns number of purchased items in itemsArr
    public func numItemsPurchased(in itemsArr: [Item]) -> Int{
       var ret: Int = 0
       let s = 0...(itemsArr.count - 1)
       for i in s{
           if(itemsArr[i].purchased){
               ret += 1
           }
       }
       return ret
    }
    */
}

 
 */
