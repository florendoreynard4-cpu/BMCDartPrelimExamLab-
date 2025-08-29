import 'dart:io'; // Import for reading user input

/// Student Grade Evaluator
/// This program asks for a student's name and their scores in
/// Assignment, Midterm, and Final Exam. Then, it calculates the weighted
/// final grade and tells if the student passed or failed.

void main() {
  // Constant values (fixed numbers)
  const double passingGrade = 60.0; // Passing score
  const double maxScore = 100.0; // Max possible score
  const double assignmentWeight = 0.2; // 20% of final grade
  const double midtermWeight = 0.3; // 30% of final grade
  const double finalExamWeight = 0.5; // 50% of final grade

  // Ask for the student's name
  stdout.write("Enter the student's name: ");
  String? inputName = stdin.readLineSync();
  String studentName =
      (inputName != null && inputName.isNotEmpty) ? inputName : "Unknown Student";

  // Function to safely read a score
  double readScore(String subject) {
    stdout.write("Enter $subject score (0 - $maxScore): ");
    String? input = stdin.readLineSync();

    try {
      double score = double.parse(input ?? "");
      if (score < 0 || score > maxScore) {
        print("Error: $subject score must be between 0 and $maxScore.");
        exit(1); // Exit the program if input is invalid
      }
      return score;
    } catch (e) {
      print("Oops! Invalid input for $subject. Program exiting...");
      exit(1);
    }
  }

  // Get all scores
  double assignmentScore = readScore("Assignment");
  double midtermScore = readScore("Midterm");
  double finalExamScore = readScore("Final Exam");

  // Compute weighted final grade
  double finalGrade = (assignmentScore * assignmentWeight) +
      (midtermScore * midtermWeight) +
      (finalExamScore * finalExamWeight);

  // Show the results
  print("\n====== Student Grade Report ======");
  print("Name: $studentName");
  print("Assignment: ${assignmentScore.toStringAsFixed(1)}");
  print("Midterm: ${midtermScore.toStringAsFixed(1)}");
  print("Final Exam: ${finalExamScore.toStringAsFixed(1)}");
  print("Final Grade: ${finalGrade.toStringAsFixed(1)}");

  // Passed or Failed?
  if (finalGrade >= passingGrade) {
    print("Result: 🎉 Congratulations, you PASSED!");
  } else {
    print("Result: ❌ Sorry, you FAILED. Better luck next time.");
  }
}
