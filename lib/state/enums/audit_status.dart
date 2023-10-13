/// Represents the status of an audit
enum AuditStatus {
  /// [initial status]
  /// The audit has not started yet.
  notStarted,

  /// [active status]
  /// The audit is currently in progress.
  inProgress,

  /// The audit is temporarily paused or delayed.
  onHold,

  /// The audit is under review by relevant parties.
  underReview,

  /// The audit is completed but is under observation.
  underObservation,

  /// [feedback and revision]
  /// The audit has been reviewed and requires revisions.
  revisionNeeded,

  /// [final status]
  /// The audit has been successfully completed.
  completed,

  /// The audit has been intentionally postponed.
  deferred,

  /// The audit has been canceled and will not be completed.
  canceled,

  /// The audit was previously completed but has been reopened for further action.
  reOpened,

  /// [unknown or error status]
  /// The status of the audit is unknown.
  unknown,

  /// The audit is no longer relevant. It has not been updated for a long time.
  stale,

  /// The audit was attempted but could not be completed successfully.
  failed,

  /// [rescheduling]
  /// The audit has been rescheduled for a future date.
  rescheduled,
}
