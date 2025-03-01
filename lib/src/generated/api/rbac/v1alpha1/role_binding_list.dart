import 'package:kubernetes/src/generated/api/rbac/v1alpha1/role_binding.dart';
import 'package:kubernetes/src/generated/apimachinery/pkg/apis/meta/v1/list_meta.dart';

/// RoleBindingList is a collection of RoleBindings Deprecated in v1.17 in favor of rbac.authorization.k8s.io/v1 RoleBindingList, and will no longer be served in v1.22.
class RoleBindingList {
  /// The main constructor.
  const RoleBindingList({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  /// Creates a RoleBindingList from JSON data.
  RoleBindingList.fromJson(Map<String, dynamic> json)
      : this(
          apiVersion: json['apiVersion'],
          items: json['items'] != null
              ? RoleBinding.listFromJson(
                  (json['items'] as Iterable).cast<Map<String, dynamic>>())
              : [],
          kind: json['kind'],
          metadata: json['metadata'] != null
              ? ListMeta.fromJson(json['metadata'])
              : null,
        );

  /// Creates a list of RoleBindingList from JSON data.
  static List<RoleBindingList> listFromJson(
      Iterable<Map<String, dynamic>> list) {
    return list.map((e) => RoleBindingList.fromJson(e)).toList();
  }

  /// Converts a RoleBindingList instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    if (apiVersion != null) {
      jsonData['apiVersion'] = apiVersion!;
    }
    jsonData['items'] = items.map((item) => item.toJson()).toList();
    if (kind != null) {
      jsonData['kind'] = kind!;
    }
    if (metadata != null) {
      jsonData['metadata'] = metadata!.toJson();
    }

    return jsonData;
  }

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources.
  final String? apiVersion;

  /// Items is a list of RoleBindings.
  final List<RoleBinding> items;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds.
  final String? kind;

  /// Standard object's metadata.
  final ListMeta? metadata;
}
