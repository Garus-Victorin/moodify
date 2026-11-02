/// Modle reprsentant un dossier contenant des fichiers audio
class FolderModel {
  final int id;
  final String name;
  final String path;
  final int songCount;
  final List<FolderModel> subfolders;

  const FolderModel({
    required this.id,
    required this.name,
    required this.path,
    this.songCount = 0,
    this.subfolders = const [],
  });

  FolderModel copyWith({
    String? name,
    String? path,
    int? songCount,
    List<FolderModel>? subfolders,
  }) {
    return FolderModel(
      id: id,
      name: name ?? this.name,
      path: path ?? this.path,
      songCount: songCount ?? this.songCount,
      subfolders: subfolders ?? this.subfolders,
    );
  }
}
