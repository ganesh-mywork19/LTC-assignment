# LTC-assignment
This is a simple iOS application built with SwiftUI, designed to demonstrate the Model-View-ViewModel (MVVM) architecture. The app showcases how to structure an iOS project using MVVM principles for better separation of concerns, testability, and scalability. It provides a clear example of how to bind data from the model layer to the user interface in SwiftUI, while leveraging ViewModel for business logic and state management.<br>

In this application, a list of GitHub users will be fetched by making an API call and displayed each user's name and profile image on the UI.

**Key Features**:
  
  - SwiftUI for UI components<br>
  - MVVM architecture for clean code structure<br>
  - Data binding using SwiftUI's @Binding, @State, and @Observable (from Observation framework)<br>
  - Example of how to manage state and handle user interactions with ViewModel<br>
  - Simple, easy-to-understand project for learning MVVM in SwiftUI<br>

UI framework: SwiftUI<br>
Architecture: MVVM<br>
API Domain: https://api.github.com <br>
EndPoint: /search/users?q=location:London <br>
Unit Tests framework: XCTest<br>
Test Covarage: 91% <br>


**Screenshots for reference from iPhone 16 Pro with iOS 18.1 (Simulator)**:<br>

![Simulator Screenshot - iPhone 16 Pro - 2024-12-30 at 01 07 33](https://github.com/user-attachments/assets/a9cdca11-f8ba-4e8e-b17f-3fae8f283e7a)
<br>
<br>
![Simulator Screenshot - iPhone 16 Pro - 2024-12-30 at 01 07 56](https://github.com/user-attachments/assets/78d95772-8b8e-4ea6-a300-aa888471f368)
<br>

**Test Covarage report for reference**:<br>

![Screenshot 2024-12-30 at 2 13 25 AM](https://github.com/user-attachments/assets/5e0efab8-5771-4cc0-9368-f7f37516bd70)
<br>


