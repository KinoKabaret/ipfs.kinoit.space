const express = require('express')
const cors = require('cors')
/*
const IPFS = require('ipfs')
const OrbitDB = require('orbit-db')

const ipfsOptions = {
    EXPERIMENTAL: {
        pubsub: true
    }
}

// Create IPFS instance
const ipfs = new IPFS(ipfsOptions)

ipfs.on('ready', () => {
    // Create OrbitDB instance
    const orbitdb = new OrbitDB(ipfs)
})
*/
const app = express()
app.use(cors())

app.use('/', express.static(__dirname))


app.listen(443, function () {
  console.log('Listening on port 443.');
});
