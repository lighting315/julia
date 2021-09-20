class UserCustom {
  // identifiant
  final String id;
  // Nom de l'utilsiateur
  final String nom;
  // Prenom de l'utilisateur
  final String prenom;
  // Date de naissance
  final String dateNaissance;
  // Email
  final String eMail;
  // Numero de telephone
  final String phone;
  // Mot de passe
  final String passeword;
  // Liste des favoris 
  final List<String> favoris; 
  /// sexe
  final String sexe;
  /// indique s'il est administrateur ou non
  final bool isAdmin; 

  const UserCustom({
    this.isAdmin = false,
    this.id,
    this.nom,
    this.prenom,
    this.dateNaissance,
    this.eMail,
    this.phone,
    this.passeword,
    this.favoris, 
    this.sexe,
  });
}
