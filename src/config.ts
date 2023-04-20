import { from } from 'env-var'

export function getConfig (env: NodeJS.ProcessEnv) {
  const { get } = from(env)

  return {
    HTTP_PORT: get('HTTP_PORT').default(8080).asPortNumber(),
    HTTP_HOST: get('HTTP_HOST').default('0.0.0.0').asString()
  }
}