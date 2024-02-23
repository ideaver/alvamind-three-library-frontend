enum AttachmentType { image, document, location }

class AttachmentModel {
  final AttachmentType type;
  final dynamic value;

  AttachmentModel({
    required this.type,
    required this.value,
  });
}