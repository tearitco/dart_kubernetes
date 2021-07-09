import 'package:kubernetes/src/generated/api/autoscaling/v2beta2/horizontal_pod_autoscaler.dart';
import 'package:kubernetes/src/generated/apimachinery/pkg/apis/meta/v1/list_meta.dart';

/// HorizontalPodAutoscalerList is a list of horizontal pod autoscaler objects.
class HorizontalPodAutoscalerList {
  /// The main constructor.
  const HorizontalPodAutoscalerList({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  /// Creates a HorizontalPodAutoscalerList from JSON data.
  HorizontalPodAutoscalerList.fromJson(Map<String, dynamic> json)
      : this(
          apiVersion: json['apiVersion'],
          items: json['items'] != null
              ? HorizontalPodAutoscaler.listFromJson(
                  (json['items'] as Iterable).cast<Map<String, dynamic>>())
              : [],
          kind: json['kind'],
          metadata: json['metadata'] != null
              ? ListMeta.fromJson(json['metadata'])
              : null,
        );

  /// Creates a list of HorizontalPodAutoscalerList from JSON data.
  static List<HorizontalPodAutoscalerList> listFromJson(
      Iterable<Map<String, dynamic>> list) {
    return list.map((e) => HorizontalPodAutoscalerList.fromJson(e)).toList();
  }

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources.
  final String? apiVersion;

  /// Items is the list of horizontal pod autoscaler objects.
  final List<HorizontalPodAutoscaler> items;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds.
  final String? kind;

  /// Metadata is the standard list metadata.
  final ListMeta? metadata;
}
