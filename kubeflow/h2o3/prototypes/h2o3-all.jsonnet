// @apiVersion 0.1
// @name io.ksonnet.pkg.h2o3
// @description H2O3 on Kubeflow
// @shortDescription H2O3
// @param name string Name to give each of the components
// @param model_server_image string gcr.io/h2o-gce/h2o3
// @optionalParam namespace string default namespace

local k = import 'k.libsonnet';
local h2o3 = import 'kubeflow/h2o3/h2o3.libsonnet';

local name = import 'param://name';
local namespace = import 'param://namespace';
local modelServerImage = import 'param://model_server_image';

std.prune(k.core.v1.list.new([
  h2o3.parts.deployment.modelServer(name, namespace, modelServerImage),
  h2o3.parts.deployment.modelService(name, namespace),
]))
