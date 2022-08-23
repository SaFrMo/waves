<template>
    <Lunchbox
        background="white"
        :cameraPosition="[15, 9, 10]"
        :cameraLook="[0, 0, 0]"
        orthographic
    >
        <mesh :rotation-x="Math.PI * -0.5" :scale="150">
            <planeGeometry :args="[1, 1, 1024, 1024]" />
            <shaderMaterial
                :args="[{ uniforms, fragmentShader, vertexShader }]"
            />
        </mesh>
    </Lunchbox>
</template>

<script lang="ts" setup>
// version of https://twitter.com/beesandbombs/status/1529439697717567490
import { reactive } from 'vue'
import { onBeforeRender } from 'lunchboxjs'
import { Vector2 } from 'three'

import vertexShader from './vert.glsl?raw'
import fragmentShader from './frag.glsl?raw'

const uniforms = reactive({
    uTime: { value: 1.0 },
    uDimensions: {
        value: new Vector2(0.0, 0.0),
    },
})

const start = Date.now()

onBeforeRender(({ renderer }) => {
    const domElement = renderer?.domElement
    if (domElement) {
        uniforms.uDimensions.value.x = domElement.width
        uniforms.uDimensions.value.y = domElement.height
    }
    uniforms.uTime.value = (Date.now() - start) * 0.001
})
</script>