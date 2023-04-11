{
  "resourceType": "GMSprite",
  "resourceVersion": "1.0",
  "name": "spr_player_attack_spinning",
  "bbox_bottom": 113,
  "bbox_left": 16,
  "bbox_right": 115,
  "bbox_top": 72,
  "bboxMode": 0,
  "collisionKind": 1,
  "collisionTolerance": 0,
  "DynamicTexturePage": false,
  "edgeFiltering": false,
  "For3D": false,
  "frames": [
    {"resourceType":"GMSpriteFrame","resourceVersion":"1.1","name":"e68008c5-a0d2-4314-bcca-f4e6bc351054",},
    {"resourceType":"GMSpriteFrame","resourceVersion":"1.1","name":"434efd2c-e7da-4a12-94ad-f043ae403f29",},
    {"resourceType":"GMSpriteFrame","resourceVersion":"1.1","name":"36f08990-bc8d-4ea2-9945-271b1561fe69",},
  ],
  "gridX": 0,
  "gridY": 0,
  "height": 128,
  "HTile": false,
  "layers": [
    {"resourceType":"GMImageLayer","resourceVersion":"1.0","name":"13a707fa-0050-4b3b-a732-d1657d19f06b","blendMode":0,"displayName":"hitbox","isLocked":false,"opacity":100.0,"visible":false,},
    {"resourceType":"GMImageLayer","resourceVersion":"1.0","name":"dc2c0ec8-d3ba-447a-ab33-97f54d7d46b4","blendMode":0,"displayName":"default","isLocked":false,"opacity":100.0,"visible":true,},
  ],
  "nineSlice": {
    "resourceType": "GMNineSliceData",
    "resourceVersion": "1.0",
    "bottom": 0,
    "enabled": false,
    "guideColour": [
      4294902015,
      4294902015,
      4294902015,
      4294902015,
    ],
    "highlightColour": 1728023040,
    "highlightStyle": 0,
    "left": 0,
    "right": 0,
    "tileMode": [
      0,
      0,
      0,
      0,
      0,
    ],
    "top": 0,
  },
  "origin": 7,
  "parent": {
    "name": "player",
    "path": "folders/Sprites/player.yy",
  },
  "preMultiplyAlpha": false,
  "sequence": {
    "resourceType": "GMSequence",
    "resourceVersion": "1.4",
    "name": "spr_player_attack_spinning",
    "autoRecord": true,
    "backdropHeight": 768,
    "backdropImageOpacity": 0.5,
    "backdropImagePath": "",
    "backdropWidth": 1366,
    "backdropXOffset": 0.0,
    "backdropYOffset": 0.0,
    "events": {"resourceType":"KeyframeStore<MessageEventKeyframe>","resourceVersion":"1.0","Keyframes":[
        {"resourceType":"Keyframe<MessageEventKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"MessageEventKeyframe","resourceVersion":"1.0","Events":[
                "on_hit_3",
              ],},},"Disabled":false,"id":"422a813c-d1a4-4561-88d0-03c3e8154e91","IsCreationKey":false,"Key":0.0,"Length":1.0,"Stretch":false,},
        {"resourceType":"Keyframe<MessageEventKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"MessageEventKeyframe","resourceVersion":"1.0","Events":[
                "on_hit_3",
              ],},},"Disabled":false,"id":"42e973a0-10b2-4ec6-b430-3f7f94dddaf8","IsCreationKey":false,"Key":1.0,"Length":1.0,"Stretch":false,},
        {"resourceType":"Keyframe<MessageEventKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"MessageEventKeyframe","resourceVersion":"1.0","Events":[
                "on_hit_3",
              ],},},"Disabled":false,"id":"f23e261a-c9bb-47b3-bb5d-f1f17d9c1b53","IsCreationKey":false,"Key":2.0,"Length":1.0,"Stretch":false,},
      ],},
    "eventStubScript": null,
    "eventToFunction": {},
    "length": 3.0,
    "lockOrigin": false,
    "moments": {"resourceType":"KeyframeStore<MomentsEventKeyframe>","resourceVersion":"1.0","Keyframes":[],},
    "playback": 1,
    "playbackSpeed": 10.0,
    "playbackSpeedType": 0,
    "showBackdrop": true,
    "showBackdropImage": false,
    "timeUnits": 1,
    "tracks": [
      {"resourceType":"GMSpriteFramesTrack","resourceVersion":"1.0","name":"frames","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<SpriteFrameKeyframe>","resourceVersion":"1.0","Keyframes":[
            {"resourceType":"Keyframe<SpriteFrameKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"SpriteFrameKeyframe","resourceVersion":"1.0","Id":{"name":"e68008c5-a0d2-4314-bcca-f4e6bc351054","path":"sprites/spr_player_attack_spinning/spr_player_attack_spinning.yy",},},},"Disabled":false,"id":"713cbe59-56f0-426d-9d90-168f000f76ba","IsCreationKey":false,"Key":0.0,"Length":1.0,"Stretch":false,},
            {"resourceType":"Keyframe<SpriteFrameKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"SpriteFrameKeyframe","resourceVersion":"1.0","Id":{"name":"434efd2c-e7da-4a12-94ad-f043ae403f29","path":"sprites/spr_player_attack_spinning/spr_player_attack_spinning.yy",},},},"Disabled":false,"id":"dda8ee99-3dcd-4c9c-ab08-ffac3720e311","IsCreationKey":false,"Key":1.0,"Length":1.0,"Stretch":false,},
            {"resourceType":"Keyframe<SpriteFrameKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"SpriteFrameKeyframe","resourceVersion":"1.0","Id":{"name":"36f08990-bc8d-4ea2-9945-271b1561fe69","path":"sprites/spr_player_attack_spinning/spr_player_attack_spinning.yy",},},},"Disabled":false,"id":"9702e446-a5fe-4a6d-8a20-59b341df8726","IsCreationKey":false,"Key":2.0,"Length":1.0,"Stretch":false,},
          ],},"modifiers":[],"spriteId":null,"trackColour":0,"tracks":[],"traits":0,},
    ],
    "visibleRange": null,
    "volume": 1.0,
    "xorigin": 64,
    "yorigin": 128,
  },
  "swatchColours": null,
  "swfPrecision": 2.525,
  "textureGroupId": {
    "name": "Default",
    "path": "texturegroups/Default",
  },
  "type": 0,
  "VTile": false,
  "width": 128,
}