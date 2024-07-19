<template>
  <div>
    <div class="hiddenCanceledTable">
      <div class="overflow-x-auto mb-4 px-4">
        <table class="table-auto border-collapse w-full text-xs md:text-base">
          <thead class="text-sm font-medium text-white">
            <tr>
              <th
                v-for="(header, index) in headers"
                :key="index"
                class="text-center sm:px-1 md:px-4 py-2 bg-blue-800"
              >
                {{ header }}
              </th>
            </tr>
          </thead>
          <tbody class="text-sm font-normal text-gray-700">
            <tr v-for="(row, index) in rows" :key="index">
              <td v-for="(cell, i) in row" :key="i">{{ cell }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const headers = ref(['顧客番号', '顧客名', '住所', '電話番号'])
const rows = ref([])

const fetchData = async () => {
  try {
    const res = await axios.get('http://localhost:80/api/customers')
    rows.value = res.data.map((customer) => [
      customer.id,
      customer.name,
      customer.address,
      customer.phone
    ])
  } catch (error) {
    console.error(error)
  }
}

onMounted(() => {
  fetchData()
})
</script>
