import * as THREE from 'three';
import * as edge from './edge';
import * as arc from './arc';
import * as polyline from './polyline';
import * as wire from './wire';
import * as loftProfiles from './loft-profiles';
import * as intersection from './intersection';

export interface Demo {
  label: string;
  create: (scene: THREE.Scene) => () => void;
}

export const demos: Demo[] = [
  edge,
  arc,
  polyline,
  wire,
  loftProfiles,
  intersection,
];
