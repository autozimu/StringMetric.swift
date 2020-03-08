# StringMetric.swift
[![CircleCI](https://circleci.com/gh/autozimu/StringMetric.swift.svg?style=svg)](https://circleci.com/gh/autozimu/StringMetric.swift)

[String metric](https://en.wikipedia.org/wiki/String_metric) functions implemented in Swift.

Currently, following functions are implemented,
- `distance`: alias of `distanceJaroWinkler`
- `distanceLevenshtein`: [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
- `distanceDamerauLevenshtein`: [Damerau-Levenshtein distance](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance)
- `distanceHamming`: [Hamming distance](https://en.wikipedia.org/wiki/Hamming_distance)
- `distanceMostFreqK`: [Most frequent k characters](https://en.wikipedia.org/wiki/Most_frequent_k_characters)
- `distanceNormalizedMostFrequentK`: [Normalized most frequent k characters](https://www.semanticscholar.org/paper/A-high-performance-approach-to-string-similarity-K-Valdestilhas-Soru/2ce037c9b5d77972af6892c170396c82d883dab9)
- `distanceJaroWinkler`: [Jaro-Winkler distance](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance)

## Usage

For [Swift Package Manager](https://github.com/apple/swift-package-manager)
users, add this module as dependency in `Package.swift`,

```swift
.Package(url: "https://github.com/autozimu/StringMetric.swift.git", majorVersion: 0)
```

## Example

```swift
"kitten".distance(between: "sitting")    // => 0.746
"君子和而不同".distance(between: "小人同而不和")    // => 0.555
```

## Documentation
<https://autozimu.github.io/StringMetric.swift/>
