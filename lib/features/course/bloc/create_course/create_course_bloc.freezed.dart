// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_course_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateCourseEvent {

 CourseCreateForm get form;
/// Create a copy of CreateCourseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCourseEventCopyWith<CreateCourseEvent> get copyWith => _$CreateCourseEventCopyWithImpl<CreateCourseEvent>(this as CreateCourseEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCourseEvent&&(identical(other.form, form) || other.form == form));
}


@override
int get hashCode => Object.hash(runtimeType,form);

@override
String toString() {
  return 'CreateCourseEvent(form: $form)';
}


}

/// @nodoc
abstract mixin class $CreateCourseEventCopyWith<$Res>  {
  factory $CreateCourseEventCopyWith(CreateCourseEvent value, $Res Function(CreateCourseEvent) _then) = _$CreateCourseEventCopyWithImpl;
@useResult
$Res call({
 CourseCreateForm form
});




}
/// @nodoc
class _$CreateCourseEventCopyWithImpl<$Res>
    implements $CreateCourseEventCopyWith<$Res> {
  _$CreateCourseEventCopyWithImpl(this._self, this._then);

  final CreateCourseEvent _self;
  final $Res Function(CreateCourseEvent) _then;

/// Create a copy of CreateCourseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? form = null,}) {
  return _then(_self.copyWith(
form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as CourseCreateForm,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCourseEvent].
extension CreateCourseEventPatterns on CreateCourseEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateCourse value)?  createCourse,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCourse() when createCourse != null:
return createCourse(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateCourse value)  createCourse,}){
final _that = this;
switch (_that) {
case _CreateCourse():
return createCourse(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateCourse value)?  createCourse,}){
final _that = this;
switch (_that) {
case _CreateCourse() when createCourse != null:
return createCourse(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CourseCreateForm form)?  createCourse,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCourse() when createCourse != null:
return createCourse(_that.form);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CourseCreateForm form)  createCourse,}) {final _that = this;
switch (_that) {
case _CreateCourse():
return createCourse(_that.form);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CourseCreateForm form)?  createCourse,}) {final _that = this;
switch (_that) {
case _CreateCourse() when createCourse != null:
return createCourse(_that.form);case _:
  return null;

}
}

}

/// @nodoc


class _CreateCourse implements CreateCourseEvent {
  const _CreateCourse(this.form);
  

@override final  CourseCreateForm form;

/// Create a copy of CreateCourseEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCourseCopyWith<_CreateCourse> get copyWith => __$CreateCourseCopyWithImpl<_CreateCourse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCourse&&(identical(other.form, form) || other.form == form));
}


@override
int get hashCode => Object.hash(runtimeType,form);

@override
String toString() {
  return 'CreateCourseEvent.createCourse(form: $form)';
}


}

/// @nodoc
abstract mixin class _$CreateCourseCopyWith<$Res> implements $CreateCourseEventCopyWith<$Res> {
  factory _$CreateCourseCopyWith(_CreateCourse value, $Res Function(_CreateCourse) _then) = __$CreateCourseCopyWithImpl;
@override @useResult
$Res call({
 CourseCreateForm form
});




}
/// @nodoc
class __$CreateCourseCopyWithImpl<$Res>
    implements _$CreateCourseCopyWith<$Res> {
  __$CreateCourseCopyWithImpl(this._self, this._then);

  final _CreateCourse _self;
  final $Res Function(_CreateCourse) _then;

/// Create a copy of CreateCourseEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? form = null,}) {
  return _then(_CreateCourse(
null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as CourseCreateForm,
  ));
}


}

// dart format on
