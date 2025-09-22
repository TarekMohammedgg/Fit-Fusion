class UserProfile {
  final String id; // نفس id بتاع auth.users
  final String username;
  final double? weight;
  final double? height;
  final double? bounce;
  final int? gymDuration;
  final int? workoutDuration;
  final DateTime? createdAt;

  UserProfile({
    required this.id,
    required this.username,
    this.weight,
    this.height,
    this.bounce,
    this.gymDuration,
    this.workoutDuration,
    this.createdAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as String,
      username: json['username'] as String,
      weight: json['weight'] as double,
      height: json['height'] as double,
      bounce: json['bounce'] as double,
      gymDuration: json['gym_duration'] as int,
      workoutDuration: json['workout_duration'] as int,
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
