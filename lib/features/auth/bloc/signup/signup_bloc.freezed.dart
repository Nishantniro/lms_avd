// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupEvent {

 SignupModel get signupmodel;
/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupEventCopyWith<SignupEvent> get copyWith => _$SignupEventCopyWithImpl<SignupEvent>(this as SignupEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupEvent&&(identical(other.signupmodel, signupmodel) || other.signupmodel == signupmodel));
}


@override
int get hashCode => Object.hash(runtimeType,signupmodel);

@override
String toString() {
  return 'SignupEvent(signupmodel: $signupmodel)';
}


}

/// @nodoc
abstract mixin class $SignupEventCopyWith<$Res>  {
  factory $SignupEventCopyWith(SignupEvent value, $Res Function(SignupEvent) _then) = _$SignupEventCopyWithImpl;
@useResult
$Res call({
 SignupModel signupmodel
});




}
/// @nodoc
class _$SignupEventCopyWithImpl<$Res>
    implements $SignupEventCopyWith<$Res> {
  _$SignupEventCopyWithImpl(this._self, this._then);

  final SignupEvent _self;
  final $Res Function(SignupEvent) _then;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? signupmodel = null,}) {
  return _then(_self.copyWith(
signupmodel: null == signupmodel ? _self.signupmodel : signupmodel // ignore: cast_nullable_to_non_nullable
as SignupModel,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupEvent].
extension SignupEventPatterns on SignupEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Signup value)?  signup,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Signup() when signup != null:
return signup(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Signup value)  signup,}){
final _that = this;
switch (_that) {
case _Signup():
return signup(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Signup value)?  signup,}){
final _that = this;
switch (_that) {
case _Signup() when signup != null:
return signup(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SignupModel signupmodel)?  signup,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Signup() when signup != null:
return signup(_that.signupmodel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SignupModel signupmodel)  signup,}) {final _that = this;
switch (_that) {
case _Signup():
return signup(_that.signupmodel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SignupModel signupmodel)?  signup,}) {final _that = this;
switch (_that) {
case _Signup() when signup != null:
return signup(_that.signupmodel);case _:
  return null;

}
}

}

/// @nodoc


class _Signup implements SignupEvent {
  const _Signup({required this.signupmodel});
  

@override final  SignupModel signupmodel;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupCopyWith<_Signup> get copyWith => __$SignupCopyWithImpl<_Signup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Signup&&(identical(other.signupmodel, signupmodel) || other.signupmodel == signupmodel));
}


@override
int get hashCode => Object.hash(runtimeType,signupmodel);

@override
String toString() {
  return 'SignupEvent.signup(signupmodel: $signupmodel)';
}


}

/// @nodoc
abstract mixin class _$SignupCopyWith<$Res> implements $SignupEventCopyWith<$Res> {
  factory _$SignupCopyWith(_Signup value, $Res Function(_Signup) _then) = __$SignupCopyWithImpl;
@override @useResult
$Res call({
 SignupModel signupmodel
});




}
/// @nodoc
class __$SignupCopyWithImpl<$Res>
    implements _$SignupCopyWith<$Res> {
  __$SignupCopyWithImpl(this._self, this._then);

  final _Signup _self;
  final $Res Function(_Signup) _then;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? signupmodel = null,}) {
  return _then(_Signup(
signupmodel: null == signupmodel ? _self.signupmodel : signupmodel // ignore: cast_nullable_to_non_nullable
as SignupModel,
  ));
}


}

// dart format on
