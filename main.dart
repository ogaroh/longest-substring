import 'dart:math';
import 'dart:developer' as dev;

void main(List<String> args) {
  // print out the longest substring without repeating characters

  dev.log(longestSubstring("servicessolutionssuccess").toString());
}

///
/// sliding window - using a list / hashset
///
int longestSubstring(String inputString) {
  int n = inputString.length; // length of the input string
  int i = 0;
  int j = 0; // left & right indices

  var characters = List.generate(128, (index) {
    return 0;
  });

  var result = 0;
  while (j < n) {
    var right = inputString[j];
    characters[right.codeUnits.first]++;

    while (characters[right.codeUnits.first] > 1) {
      var left = inputString[i];
      characters[left.codeUnits.first]--;

      i++;
    }

    result = max(result, j - i + 1);
    j++;
  }
  return result;
}
