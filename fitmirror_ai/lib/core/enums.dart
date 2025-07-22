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

enum ActivityLevel {
  // ¡Enum ActivityLevel añadido/reconfirmado!
  sedentary, // Poco o ningún ejercicio
  lightlyActive, // Ejercicio ligero/deportes 1-3 días/semana
  moderatelyActive, // Ejercicio moderado/deportes 3-5 días/semana
  veryActive, // Ejercicio duro/deportes 6-7 días/semana
  extraActive, // Ejercicio muy duro/trabajo físico
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
// toApiString() para enviar a la base de datos/API (Debe COINCIDIR con user_models.py)
extension GenderExtension on Gender {
  String toApiString() {
    switch (this) {
      case Gender.male:
        return "Masculino"; // Coincide con Python
      case Gender.female:
        return "Femenino"; // Coincide con Python
      case Gender.other:
        return "Otro"; // Coincide con Python
    }
  }

  // toSpanishString() para mostrar en la interfaz de usuario
  String toSpanishString() {
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
        return "perder peso"; // Coincide con Python
      case Goal.gainMuscle:
        return "ganar músculo"; // Coincide con Python
      case Goal.maintainWeight:
        return "mantener peso"; // Coincide con Python
      case Goal.improveFitness:
        return "mejorar condición física"; // Coincide con Python
      case Goal.generalHealth:
        return "salud general"; // Coincide con Python
    }
  }

  String toSpanishString() {
    switch (this) {
      case Goal.loseWeight:
        return "Perder peso";
      case Goal.gainMuscle:
        return "Ganar músculo";
      case Goal.maintainWeight:
        return "Mantener peso";
      case Goal.improveFitness:
        return "Mejorar condición física";
      case Goal.generalHealth:
        return "Salud general";
    }
  }
}

extension WorkoutPlaceExtension on WorkoutPlace {
  String toApiString() {
    switch (this) {
      case WorkoutPlace.home:
        return "Casa"; // Coincide con Python
      case WorkoutPlace.gym:
        return "Gimnasio"; // Coincide con Python
      case WorkoutPlace.outdoor:
        return "Al aire libre"; // Coincide con Python
      case WorkoutPlace.both:
        return "Casa y gimnasio"; // Coincide con Python
    }
  }

  String toSpanishString() {
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
    return name; // 'slow', 'normal', 'fast' (Coincide con Python)
  }

  String toSpanishString() {
    switch (this) {
      case WeightChangeSpeed.slow:
        return "Lenta";
      case WeightChangeSpeed.normal:
        return "Normal";
      case WeightChangeSpeed.fast:
        return "Rápida";
    }
  }
}

extension ActivityLevelExtension on ActivityLevel {
  // ¡Extensión añadida!
  String toApiString() {
    return name; // 'sedentary', 'lightlyActive', etc. (Coincide con Python)
  }

  String toSpanishString() {
    switch (this) {
      case ActivityLevel.sedentary:
        return "Sedentario";
      case ActivityLevel.lightlyActive:
        return "Actividad ligera";
      case ActivityLevel.moderatelyActive:
        return "Actividad moderada";
      case ActivityLevel.veryActive:
        return "Muy activo";
      case ActivityLevel.extraActive:
        return "Extra activo";
    }
  }
}

extension MuscleGroupFocusExtension on MuscleGroupFocus {
  String toApiString() {
    return name; // 'upper', 'lower', etc. (Coincide con Python)
  }

  String toSpanishString() {
    switch (this) {
      case MuscleGroupFocus.upper:
        return "Parte superior";
      case MuscleGroupFocus.lower:
        return "Parte inferior";
      case MuscleGroupFocus.balanced:
        return "Equilibrado";
      case MuscleGroupFocus.core:
        return "Core";
      case MuscleGroupFocus.fullBody:
        return "Cuerpo completo";
    }
  }
}

extension CardioTypeExtension on CardioType {
  String toApiString() {
    return name; // 'none', 'light', etc. (Coincide con Python)
  }

  String toSpanishString() {
    switch (this) {
      case CardioType.none:
        return "Ninguno";
      case CardioType.light:
        return "Ligero";
      case CardioType.moderate:
        return "Moderado";
      case CardioType.intense:
        return "Intenso";
    }
  }
}

extension DietaryTypeExtension on DietaryType {
  String toApiString() {
    return name; // 'standard', 'pescatarian', etc. (Coincide con Python)
  }

  String toSpanishString() {
    switch (this) {
      case DietaryType.standard:
        return "Estándar";
      case DietaryType.pescatarian:
        return "Pescetariana";
      case DietaryType.vegetarian:
        return "Vegetariana";
      case DietaryType.vegan:
        return "Vegana";
    }
  }
}

extension DietFocusExtension on DietFocus {
  String toApiString() {
    return name; // 'highProtein', 'balanced', etc. (Coincide con Python)
  }

  String toSpanishString() {
    switch (this) {
      case DietFocus.highProtein:
        return "Alto en proteína";
      case DietFocus.balanced:
        return "Equilibrado";
      case DietFocus.lowCarb:
        return "Bajo en carbohidratos";
      case DietFocus.lowFat:
        return "Bajo en grasa";
      case DietFocus.mediterranean:
        return "Mediterránea";
      case DietFocus.keto:
        return "Keto";
    }
  }
}

// Métodos para convertir de String (desde Firestore/API) a Enum
// Deben poder parsear los strings que envía la API
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

ActivityLevel? activityLevelFromString(String? value) {
  // ¡Función añadida!
  if (value == null) return null;
  try {
    return ActivityLevel.values.firstWhere((e) => e.name == value);
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
