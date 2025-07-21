// lib/core/enums.dart

enum Gender {
  male,
  female,
  other,
}

enum Goal {
  loseWeight,
  gainMuscle,
  maintainWeight,
  improveFitness,
  generalHealth,
}

enum WorkoutPlace {
  home,
  gym,
  outdoor,
  both,
}

enum WeightChangeSpeed {
  slow,
  normal,
  fast,
}

enum MuscleGroupFocus {
  upper,
  lower,
  balanced,
  core,
  fullBody,
}

enum CardioType {
  none,
  light,
  moderate,
  intense,
}

enum DietaryType {
  standard,
  pescatarian,
  vegetarian,
  vegan,
}

enum DietFocus {
  highProtein,
  balanced,
  lowCarb,
  lowFat,
  mediterranean,
  keto,
}

// Extensiones útiles para convertir de/a String
extension GenderExtension on Gender {
  String toApiString() {
    switch (this) {
      case Gender.male:
        return "Masculino";
      case Gender.female:
        return "Femenino";
      case Gender.other:
        return "Otro";
    }
  }
}

extension GoalExtension on Goal {
  String toApiString() {
    switch (this) {
      case Goal.loseWeight:
        return "perder peso";
      case Goal.gainMuscle:
        return "ganar músculo";
      case Goal.maintainWeight:
        return "mantener peso";
      case Goal.improveFitness:
        return "mejorar condición física";
      case Goal.generalHealth:
        return "salud general";
    }
  }
}

extension WorkoutPlaceExtension on WorkoutPlace {
  String toApiString() {
    switch (this) {
      case WorkoutPlace.home:
        return "Casa";
      case WorkoutPlace.gym:
        return "Gimnasio";
      case WorkoutPlace.outdoor:
        return "Al aire libre";
      case WorkoutPlace.both:
        return "Casa y gimnasio";
    }
  }
}

extension WeightChangeSpeedExtension on WeightChangeSpeed {
  String toApiString() {
    return name; // Uses the enum name directly for 'slow', 'normal', 'fast'
  }
}

extension MuscleGroupFocusExtension on MuscleGroupFocus {
  String toApiString() {
    return name; // Uses the enum name directly
  }
}

extension CardioTypeExtension on CardioType {
  String toApiString() {
    return name; // Uses the enum name directly
  }
}

extension DietaryTypeExtension on DietaryType {
  String toApiString() {
    return name; // Uses the enum name directly
  }
}

extension DietFocusExtension on DietFocus {
  String toApiString() {
    return name; // Uses the enum name directly
  }
}

// Métodos para convertir de String (desde Firestore/API) a Enum
Gender? genderFromString(String? value) {
  if (value == null) return null;
  switch (value) {
    case "Masculino":
      return Gender.male;
    case "Femenino":
      return Gender.female;
    case "Otro":
      return Gender.other;
    default:
      return null;
  }
}

Goal? goalFromString(String? value) {
  if (value == null) return null;
  switch (value) {
    case "perder peso":
      return Goal.loseWeight;
    case "ganar músculo":
      return Goal.gainMuscle;
    case "mantener peso":
      return Goal.maintainWeight;
    case "mejorar condición física":
      return Goal.improveFitness;
    case "salud general":
      return Goal.generalHealth;
    default:
      return null;
  }
}

WorkoutPlace? workoutPlaceFromString(String? value) {
  if (value == null) return null;
  switch (value) {
    case "Casa":
      return WorkoutPlace.home;
    case "Gimnasio":
      return WorkoutPlace.gym;
    case "Al aire libre":
      return WorkoutPlace.outdoor;
    case "Casa y gimnasio":
      return WorkoutPlace.both;
    default:
      return null;
  }
}

WeightChangeSpeed? weightChangeSpeedFromString(String? value) {
  if (value == null) return null;
  try {
    return WeightChangeSpeed.values.firstWhere((e) => e.name == value);
  } catch (e) {
    return null;
  }
}

MuscleGroupFocus? muscleGroupFocusFromString(String? value) {
  if (value == null) return null;
  try {
    return MuscleGroupFocus.values.firstWhere((e) => e.name == value);
  } catch (e) {
    return null;
  }
}

CardioType? cardioTypeFromString(String? value) {
  if (value == null) return null;
  try {
    return CardioType.values.firstWhere((e) => e.name == value);
  } catch (e) {
    return null;
  }
}

DietaryType? dietaryTypeFromString(String? value) {
  if (value == null) return null;
  try {
    return DietaryType.values.firstWhere((e) => e.name == value);
  } catch (e) {
    return null;
  }
}

DietFocus? dietFocusFromString(String? value) {
  if (value == null) return null;
  try {
    return DietFocus.values.firstWhere((e) => e.name == value);
  } catch (e) {
    return null;
  }
}
