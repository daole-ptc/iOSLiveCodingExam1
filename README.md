# iOSLiveCodingExam1
iOS Live Coding Exam 1

## Time Duration

1. Pre Session: 15 minutes
- Clone source code, run `pod` and try to run app with XCode
- Read exercises carefully and prepare the solution
- 5 minutes to show up solution before start coding

2. Coding Session: 60 minutes

- Must implement all **Required exercise**
- Require the code can be complied and run success on iPhone Simulator
- Can use all third parties, includes all third parties that already set up
- Interviewer can make questions during this session

3. Post Session: 15 minutes

- Candidate zip the code and send to interviewer
- Interviewer ask about pros and cons about the solution and implementation
- Candidate needs give more solutions about some improvements or new features 

## Prerequisite

- Github account
- XCode: 12.5 or above
- Cocoapod: 1.11.2 or above
- Library is already set up:
  + KingFisher: image loader 

## Exercise

<img src="./sample.gif" width="300" alt="Sample" />

App has 3 tabs:
1. Tab 1: **Sample**
- Load list of `Contact` with show on screen with `avatar` `name` `company` and `language`
- The data of contacts is pulled from assets file `/data/contacts.json`

2. Tab 2: **Exam**
- Here is tab that candidate will start implement in case pick **Option 1**

3. Tab 3: **Todo**
- Here is tab that candidate will start implement in case pick **Option 2**

## Option 1 

### Required

1. Refactor
- Analyze current code in tab 1 and show up the current `performance issue` and then fix it

2. Rebuild

<img src="./basic.gif" width="300" alt="Basic" />

In tab 2, rebuild the contact list with required:
- Use an architecture model like **MVVM, MVP or Viper**
- Use **SwiftUI**
- Build one more screen Contact Detail (with defined UI) and navigate from list to detail
- The `avatar` image on screen must be `lazy loading` with `placeholder`
- In contact detail or row item in list, the field `language` will become to `country` :
  +  `Native` if language is the same with device's language
  +  `Foreigner` if language is different with device's language
- Write **unit test** for the function to get `the value of country` 

### Additional 
- Instead of get contact list from assets, get from API URL: ``
- Build `Refresh button` on top of list. When touch on this button, reload the contact list with `loading indicator` is shown

## Option 2