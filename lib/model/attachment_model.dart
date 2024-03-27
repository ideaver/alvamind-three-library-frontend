enum AttachmentType {
  image,
  document,
  location,
  video,
  other,
}

class AttachmentModel {
  final AttachmentType type;
  final dynamic value;

  AttachmentModel({
    required this.type,
    required this.value,
  });

  static AttachmentType fileTypeToAttachmentType(String? type) {
    List<String> imageType = ["jpg", "jpeg", "png", "gif"];
    List<String> documentType = ["pdf", "doc", "docx", "xls", "xlsx", "csv", "ppt", "pptx", "xml"];
    List<String> videoType = ["mp4", "mpeg", "flv", "3gp", "mkv", "mov"];

    if (imageType.contains(type?.toLowerCase())) {
      return AttachmentType.image;
    }

    if (documentType.contains(type?.toLowerCase())) {
      return AttachmentType.document;
    }

    if (videoType.contains(type?.toLowerCase())) {
      return AttachmentType.video;
    }

    return AttachmentType.other;
  }
}
