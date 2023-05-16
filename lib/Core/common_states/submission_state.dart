abstract class SubmissionState{
  const SubmissionState();
}
class InitialSubmissionState extends SubmissionState {}
class FormSubmitting extends SubmissionState{}
class SubmissionSuccess extends SubmissionState{}
class SubmissionFailed extends SubmissionState{
  final Exception exception;
  SubmissionFailed(this.exception);
}