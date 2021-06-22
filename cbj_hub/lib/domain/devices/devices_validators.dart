import 'package:cbj_hub/domain/device_type/device_type_enums.dart';
import 'package:cbj_hub/domain/devices/devices_failures.dart';
import 'package:dartz/dartz.dart';

Either<DevicesFailure<String>, String> validateDeviceNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(DevicesFailure.empty(
      failedValue: input,
    ));
  }
}

Either<DevicesFailure<String>, String> validateLastKnownIpNotEmpty(
    String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(DevicesFailure.empty(
      failedValue: input,
    ));
  }
}

Either<DevicesFailure<String>, String> validatePowerConsumptionNotEmpty(
    String input) {
  if (double.tryParse(input) != null) {
    return right(input);
  } else {
    return left(const DevicesFailure.powerConsumptionIsNotNumber());
  }
}

Either<DevicesFailure<String>, String> validateRoomNameNotEmpty(String input) {
  if (input != null) {
    return right(input);
  } else {
    return left(DevicesFailure.empty(failedValue: input));
  }
}

Either<DevicesFailure<String>, String> validateMdnsNameNotEmpty(String input) {
  if (input != null) {
    return right(input);
  } else {
    return left(DevicesFailure.empty(failedValue: input));
  }
}

Either<DevicesFailure<String>, String> validateWiFiNameNotEmpty(String input) {
  if (input != null) {
    return right(input);
  } else {
    return left(DevicesFailure.empty(failedValue: input));
  }
}

Either<DevicesFailure<String>, String> validateDeviceMaxNameLength(
    String input, int maxLength) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(DevicesFailure.exceedingLength(
      failedValue: input,
      max: maxLength,
    ));
  }
}

Either<DevicesFailure<String>, String> validateDeviceStateExist(String input) {
  if (EnumHelper.stringToDeviceState(input) != null) {
    return right(input);
  }
  return left(const DevicesFailure.deviceActionDoesNotExist());
}

Either<DevicesFailure<String>, String> validateDeviceActionExist(String input) {
  if (EnumHelper.stringToDeviceAction(input) != null) {
    return right(input);
  }
  return left(const DevicesFailure.deviceActionDoesNotExist());
}

Either<DevicesFailure<String>, String> validateDeviceTypeExist(String input) {
  if (EnumHelper.stringToDt(input) != null) {
    return right(input);
  }
  return left(const DevicesFailure.deviceTypeDoesNotExist());
}