import 'package:cbj_hub/domain/device_type/device_type_enums.dart';
import 'package:cbj_hub/domain/devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_hub/domain/devices/abstract_device/value_objects_core.dart';
import 'package:cbj_hub/domain/devices/basic_device/device_entity.dart';
import 'package:cbj_hub/domain/devices/basic_device/value_objects.dart';
import 'package:cbj_hub/domain/devices/sonoff_s20/sonoff_s20_device_entity.dart';
import 'package:cbj_hub/domain/devices/sonoff_s20/sonoff_s20_value_objects.dart';
import 'package:cbj_hub/domain/local_db/i_local_db_repository.dart';
import 'package:cbj_hub/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ILocalDbRepository)
class LocalDbRepository extends ILocalDbRepository {
  @override
  List<DeviceEntityAbstract> getSmartDevices() {
    final String guyRoomId = CoreUniqueId().getOrCrash()!;

    final SonoffS20DE firstRealDeviceTest = SonoffS20DE(
      id: CoreUniqueId.fromUniqueString('0ecb1040-e724-11eb-8cec-954d01dcce33'),
      defaultName: SonoffS20DefaultName('guy ceiling'),
      roomId: CoreUniqueId(),
      roomName: SonoffS20RoomName('Guyy'),
      deviceStateGRPC: SonoffS20State(
          EnumHelper.deviceStateToString(DeviceStateGRPC.waitingInComp)),
      senderDeviceOs: SonoffS20SenderDeviceOs('ESPHome'),
      senderDeviceModel: SonoffS20SenderDeviceModel('ESP8266 D1 R1'),
      stateMassage: SonoffS20StateMassage('Test'),
      senderId: SonoffS20SenderId(),
      deviceActions:
          SonoffS20Action(EnumHelper.deviceActionToString(DeviceActions.off)),
      deviceTypes: SonoffS20Type(EnumHelper.dTToString(DeviceTypes.light)),
      compUuid: SonoffS20CompUuid('9C:9D:7E:48:60:48'),
      lastKnownIp: SonoffS20LastKnownIp('192.168.31.21'),
      deviceSecondWiFi: SonoffS20SecondWiFiName('amiuz2'),
      deviceMdnsName: SonoffS20MdnsName('guy_ceiling'),
      powerConsumption: SonoffS20PowerConsumption('0'),
      sonoffS20SwitchKey: SonoffS20SwitchKey('1360107432'),
    );

    final SonoffS20DE sonoffS20 = SonoffS20DE(
      id: CoreUniqueId(),
      defaultName: SonoffS20DefaultName('Ceiling'),
      roomId: CoreUniqueId.fromUniqueString(guyRoomId),
      roomName: SonoffS20RoomName('Guy'),
      deviceStateGRPC: SonoffS20State(DeviceStateGRPC.ack.toString()),
      stateMassage: SonoffS20StateMassage('Hello World'),
      senderDeviceOs: SonoffS20SenderDeviceOs('Linux'),
      senderDeviceModel: SonoffS20SenderDeviceModel('Computer'),
      senderId: SonoffS20SenderId(),
      deviceActions: SonoffS20Action(DeviceActions.on.toString()),
      deviceTypes: SonoffS20Type(DeviceTypes.light.toString()),
      compUuid: SonoffS20CompUuid('Comp1'),
      lastKnownIp: SonoffS20LastKnownIp('10.0.0.7'),
      powerConsumption: SonoffS20PowerConsumption('0'),
      deviceMdnsName: SonoffS20MdnsName('CeilingGuy'),
      deviceSecondWiFi: SonoffS20SecondWiFiName('amiuz2'),
    );

    final DeviceEntity deviceEntity = DeviceEntity(
      id: CoreUniqueId(),
      defaultName: DeviceDefaultName('Ceiling'),
      roomId: CoreUniqueId.fromUniqueString(guyRoomId),
      roomName: DeviceRoomName('Guy'),
      deviceStateGRPC: DeviceState(DeviceStateGRPC.ack.toString()),
      stateMassage: DeviceStateMassage('Hello World'),
      senderDeviceOs: DeviceSenderDeviceOs('Linux'),
      senderDeviceModel: DeviceSenderDeviceModel('Computer'),
      senderId: DeviceSenderId(),
      deviceActions: DeviceAction(DeviceActions.on.toString()),
      deviceTypes: DeviceType(DeviceTypes.light.toString()),
      compUuid: DeviceCompUuid('Comp1'),
      lastKnownIp: DeviceLastKnownIp('10.0.0.54'),
      powerConsumption: DevicePowerConsumption('0'),
      deviceMdnsName: DeviceMdnsName('CeilingGuy'),
      deviceSecondWiFi: DeviceSecondWiFiName('amiuz2'),
    );

    final DeviceEntity deviceEntityS = DeviceEntity(
      id: CoreUniqueId(),
      defaultName: DeviceDefaultName('top'),
      roomId: CoreUniqueId(),
      roomName: DeviceRoomName('Omer'),
      deviceStateGRPC: DeviceState(DeviceStateGRPC.ack.toString()),
      stateMassage: DeviceStateMassage('Hello World'),
      senderDeviceOs: DeviceSenderDeviceOs('Linux'),
      senderDeviceModel: DeviceSenderDeviceModel('Computer'),
      senderId: DeviceSenderId(),
      deviceActions: DeviceAction(DeviceActions.on.toString()),
      deviceTypes: DeviceType(DeviceTypes.light.toString()),
      compUuid: DeviceCompUuid('Comp1'),
      lastKnownIp: DeviceLastKnownIp('10.0.0.7'),
      powerConsumption: DevicePowerConsumption('0'),
      deviceMdnsName: DeviceMdnsName('CeilingGuy'),
      deviceSecondWiFi: DeviceSecondWiFiName('amiuz2'),
    );

    return [firstRealDeviceTest];
  }

  @override
  void saveSmartDevices(List<DeviceEntity> deviceList) {
    // TODO: implement saveSmartDevices
  }
}

// /// Stream of saving all devices changes
// class AppClientStream {
//   static StreamController<MapEntry<String, String>> controller =
//       StreamController();
//
//   static Stream<MapEntry<String, String>> get stream =>
//       controller.stream.asBroadcastStream();
// }
