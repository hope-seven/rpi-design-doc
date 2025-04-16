class TeamMember {
  final String name;
  final String imageAsset;
  final String role; // "grad" or "undergrad"
  final String? email;

  TeamMember({
    required this.name,
    required this.imageAsset,
    required this.role,
    this.email,
  });
}
