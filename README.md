# MockTechTestPost
Mock app for Tech Test

## Purpose
The purpose of this project is to built a simple app using swift and uikit

## Architecture
Viper, why? because i am currently learning about viper, nothing more than that.

## Dependencies
  1. RxSwift
  2. SkeletonView
  3. Alamofire
  4. KingFisher

## Parameters
  1. List of Post page (100%)
  2. Post Detail (100%)
  3. User Detail (95%)
    Reasons : 
            a. User cant tap collectionview cell untill they scroll them
  4. Photo Detail (100%)
  5. Test Case (0%)
  
## Resources
  1. RestAPI : https://jsonplaceholder.typicode.com
  
## Bugs so far 
  1. CollectionView Inside TableViewCell can't be tapped untill you scroll them
    solution :
      a. CollectionView inside TableView Header
      b. Implement Compositional Layout
