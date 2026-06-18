// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_apply_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerApplyEvent {

 ApplyTrainerModel get apply;
/// Create a copy of TrainerApplyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerApplyEventCopyWith<TrainerApplyEvent> get copyWith => _$TrainerApplyEventCopyWithImpl<TrainerApplyEvent>(this as TrainerApplyEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerApplyEvent&&(identical(other.apply, apply) || other.apply == apply));
}


@override
int get hashCode => Object.hash(runtimeType,apply);

@override
String toString() {
  return 'TrainerApplyEvent(apply: $apply)';
}


}

/// @nodoc
abstract mixin class $TrainerApplyEventCopyWith<$Res>  {
  factory $TrainerApplyEventCopyWith(TrainerApplyEvent value, $Res Function(TrainerApplyEvent) _then) = _$TrainerApplyEventCopyWithImpl;
@useResult
$Res call({
 ApplyTrainerModel apply
});




}
/// @nodoc
class _$TrainerApplyEventCopyWithImpl<$Res>
    implements $TrainerApplyEventCopyWith<$Res> {
  _$TrainerApplyEventCopyWithImpl(this._self, this._then);

  final TrainerApplyEvent _self;
  final $Res Function(TrainerApplyEvent) _then;

/// Create a copy of TrainerApplyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apply = null,}) {
  return _then(_self.copyWith(
apply: null == apply ? _self.apply : apply // ignore: cast_nullable_to_non_nullable
as ApplyTrainerModel,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerApplyEvent].
extension TrainerApplyEventPatterns on TrainerApplyEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ApplyTrainer value)?  apply,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplyTrainer() when apply != null:
return apply(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ApplyTrainer value)  apply,}){
final _that = this;
switch (_that) {
case _ApplyTrainer():
return apply(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ApplyTrainer value)?  apply,}){
final _that = this;
switch (_that) {
case _ApplyTrainer() when apply != null:
return apply(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ApplyTrainerModel apply)?  apply,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplyTrainer() when apply != null:
return apply(_that.apply);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ApplyTrainerModel apply)  apply,}) {final _that = this;
switch (_that) {
case _ApplyTrainer():
return apply(_that.apply);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ApplyTrainerModel apply)?  apply,}) {final _that = this;
switch (_that) {
case _ApplyTrainer() when apply != null:
return apply(_that.apply);case _:
  return null;

}
}

}

/// @nodoc


class _ApplyTrainer implements TrainerApplyEvent {
  const _ApplyTrainer({required this.apply});
  

@override final  ApplyTrainerModel apply;

/// Create a copy of TrainerApplyEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplyTrainerCopyWith<_ApplyTrainer> get copyWith => __$ApplyTrainerCopyWithImpl<_ApplyTrainer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplyTrainer&&(identical(other.apply, apply) || other.apply == apply));
}


@override
int get hashCode => Object.hash(runtimeType,apply);

@override
String toString() {
  return 'TrainerApplyEvent.apply(apply: $apply)';
}


}

/// @nodoc
abstract mixin class _$ApplyTrainerCopyWith<$Res> implements $TrainerApplyEventCopyWith<$Res> {
  factory _$ApplyTrainerCopyWith(_ApplyTrainer value, $Res Function(_ApplyTrainer) _then) = __$ApplyTrainerCopyWithImpl;
@override @useResult
$Res call({
 ApplyTrainerModel apply
});




}
/// @nodoc
class __$ApplyTrainerCopyWithImpl<$Res>
    implements _$ApplyTrainerCopyWith<$Res> {
  __$ApplyTrainerCopyWithImpl(this._self, this._then);

  final _ApplyTrainer _self;
  final $Res Function(_ApplyTrainer) _then;

/// Create a copy of TrainerApplyEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apply = null,}) {
  return _then(_ApplyTrainer(
apply: null == apply ? _self.apply : apply // ignore: cast_nullable_to_non_nullable
as ApplyTrainerModel,
  ));
}


}

// dart format on
