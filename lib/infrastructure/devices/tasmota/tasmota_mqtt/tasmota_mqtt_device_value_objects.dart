import 'package:cbj_hub/domain/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_hub/domain/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_hub/infrastructure/devices/tasmota/tasmota_mqtt/tasmota_mqtt_device_validators.dart';
import 'package:dartz/dartz.dart';

/// TasmotaMqtt device unique address that came withe the device
class TasmotaMqttDeviceTopicName extends ValueObjectCore<String> {
  factory TasmotaMqttDeviceTopicName(String? input) {
    assert(input != null);
    return TasmotaMqttDeviceTopicName._(
      validateTasmotaMqttDeviceTopicNameNotEmpty(input!),
    );
  }

  const TasmotaMqttDeviceTopicName._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}
