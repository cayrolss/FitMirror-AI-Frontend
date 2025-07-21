// lib/features/auth/domain/entities/user_entity.dart

import 'package:equatable/equatable.dart';
import 'package:fitmirror_ai/core/enums.dart';

// Clase para representar la entidad de usuario en nuestro dominio
// Usa Equatable para facilitar las comparaciones de objetos
class UserEntity extends Equatable {
  final String uid;
  final String? email;
  final String name; // Nombre para mostrar del usuario
  final int? age;
  final double? height; // Altura en cm
  final Gender? gender;

  const UserEntity({
    required this.uid,
    this.email,
    required this.name,
    this.age,
    this.height,
    this.gender,
  });

  // Método copyWith para crear una nueva instancia con propiedades modificadas
  UserEntity copyWith({
    String? uid,
    String? email,
    String? name,
    int? age,
    double? height,
    Gender? gender,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      age: age ?? this.age,
      height: height ?? this.height,
      gender: gender ?? this.gender,
    );
  }

  // Las propiedades de Equatable que se usarán para comparar la igualdad de dos UserEntity
  @override
  List<Object?> get props => [uid, email, name, age, height, gender];
}
